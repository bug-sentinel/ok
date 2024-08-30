package pkg

import (
	"encoding/json"
	"fmt"
	"net/url"

	"github.com/oslokommune/ok/pkg/pkg/config"
	"github.com/oslokommune/ok/pkg/pkg/githubreleases"
	"github.com/spf13/cobra"
)

var ConfigCommand = &cobra.Command{
	Use: "config",
	RunE: func(cmd *cobra.Command, args []string) error {
		cmd.Println("config command")
		return nil
	},
}

type DownloadedBoilThingy struct {
	IsRootCfg    bool
	Path         string
	Namespaces   []string
	Config       *BoilerplateConfig
	Dependencies []BoilerplateDependency
	Variables    []BoilerplateVariable
}

var DownloadCommand = &cobra.Command{
	Use: "download",
	RunE: func(cmd *cobra.Command, args []string) error {
		gh, err := githubreleases.GetGitHubClient()
		if err != nil {
			return fmt.Errorf("getting GitHub client: %w", err)
		}
		releases, err := githubreleases.GetLatestReleases()
		if err != nil {
			return fmt.Errorf("getting latest releases: %w", err)
		}

		templateName := args[0]
		templateVersion := releases[templateName]
		githubRef := fmt.Sprintf("%s-%s", templateName, templateVersion)
		templatePath := mustJoinUri("boilerplate/terraform", templateName)
		//templatePath := "boilerplate/terraform"
		fileDownloader := githubreleases.NewFileDownloader(gh, boilerplateRepoOwner, boilerplateRepoName, githubRef)
		stacks, err := config.DownloadBoilerplateStacksWithDependencies(cmd.Context(), fileDownloader, templatePath)
		if err != nil {
			return fmt.Errorf("downloading boilerplate stacks: %w", err)
		}
		moduleVariables := config.BuildModuleVariables("", stacks[0], stacks, "some/output/folder")
		schema, err := config.TransformModulesToJsonSchema(moduleVariables)
		if err != nil {
			return fmt.Errorf("transforming modules to json schema: %w", err)
		}

		bts, _ := json.MarshalIndent(schema, "", "  ")
		fmt.Println(string(bts))

		return err
	},
}

func mustJoinUri(base, path string) string {
	uri, err := url.JoinPath(base, path)
	if err != nil {
		panic(err)
	}
	return uri
}

type (
	BoilerplateVariable struct {
		Name        string `yaml:"name,omitempty"`
		Description string `yaml:"description,omitempty"`
		Type        string `yaml:"type,omitempty"`
		Default     any    `yaml:"default,omitempty"`
	}

	BoilerplateDependency struct {
		Name         string `yaml:"name"`
		TemplateUrl  string `yaml:"template-url"`
		OutputFolder string `yaml:"output-folder"`
	}

	BoilerplateConfig struct {
		Variables    []BoilerplateVariable   `yaml:"variables"`
		Dependencies []BoilerplateDependency `yaml:"dependencies"`
	}
)

func init() {
	ConfigCommand.AddCommand(DownloadCommand)
}
