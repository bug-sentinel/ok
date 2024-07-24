package install

import (
	"fmt"
	"github.com/stretchr/testify/require"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

import (
	"gotest.tools/v3/assert"
	"testing"
)

func TestInstall(t *testing.T) {
	testCases := []struct {
		testName                  string
		packageManifestFilename   string
		expectBoilerplateCommands []*exec.Cmd
		outputFolders             []string
	}{
		{
			testName:                "Should install all packages from packages.yml",
			packageManifestFilename: "packages.yml",
			expectBoilerplateCommands: []*exec.Cmd{
				exec.Command(
					"boilerplate",
					"--template-url", DefaultBaseUrl+"/app?ref=app-v6.1.1",
					"--output-folder", "out/app-hello",
					"--non-interactive",
					"--var-file", "config/common-config.yml",
					"--var-file", "config/app-hello.yml",
				),
				exec.Command(
					"boilerplate",
					"--template-url", DefaultBaseUrl+"/networking?ref=main",
					"--output-folder", "out/networking",
					"--non-interactive",
					"--var-file", "config/common-config.yml",
					"--var-file", "config/networking.yml",
				),
			},
		},
		{
			testName:                "Should install package with specified output folder",
			packageManifestFilename: "packages.yml",
			outputFolders:           []string{"out/app-hello"},
			expectBoilerplateCommands: []*exec.Cmd{
				exec.Command(
					"boilerplate",
					"--template-url", DefaultBaseUrl+"/app?ref=app-v6.1.1",
					"--output-folder", "out/app-hello",
					"--non-interactive",
					"--var-file", "config/common-config.yml",
					"--var-file", "config/app-hello.yml",
				),
			},
		},
	}

	for _, tc := range testCases {
		tc := tc

		t.Run(tc.testName, func(t *testing.T) {
			// Given
			inputFile, err := getTestdataFilepath(tc.packageManifestFilename)
			require.Nil(t, err)

			// When
			cmds, err := CreateBoilerplateCommands(inputFile, tc.outputFolders)

			// Then
			assert.NilError(t, err)

			for i, cmd := range cmds {
				assert.Equal(t, cmd.Path, tc.expectBoilerplateCommands[i].Path)
				assert.Equal(t,
					strings.Join(cmd.Args, ","),
					strings.Join(tc.expectBoilerplateCommands[i].Args, ","))
			}

			assert.Equal(t, len(cmds), len(tc.expectBoilerplateCommands))
		})
	}
}

func getTestdataFilepath(testDataFilename string) (string, error) {
	cwd, err := os.Getwd()
	if err != nil {
		return "", fmt.Errorf("getting current directory: %w", err)
	}

	return filepath.Join(cwd, "testdata", testDataFilename), nil
}
