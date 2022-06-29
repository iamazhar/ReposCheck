# ReposCheck
A very simple macOS menu bar app to check if mutliple repos within `/Documents/GitHub` or a user specified directory path have any modified files. You can also specify your own path for the `repos-status.sh` script.
The UI is built using SwiftUI.

Dark             |  Light
:-------------------------:|:-------------------------:
![](https://github.com/iamazhar/ReposCheck/blob/main/preview-dark.png)  |  ![](https://github.com/iamazhar/ReposCheck/blob/main/preview-light.png)

# Installation
## Download and install script and app
1. Download and add the `repos-status.sh` script file to your repos directory.
2. Run command `chmod 777 git-status` in the directory to make this file executable.
3. Download the archive for the latest release tag.
4. Launch the app.
5. If you get an error alert go to `System Preferences` -> `Security & Privacy` -> `General` and click `Open Anyway`
6. Move application to `Applications` folder.
> (Optional) - If you want the app to launch on each startup go to `System Preferences` -> `Users & Groups` select your user and add `ReposCheck` to `LoginItems`

## Building from Xcode
1. Add repos you want to track inside `/Documents/GitHub` or a path of your choosing.
2. Add the `repos-status.sh` script file to above directory.
3. Run command `chmod 777 git-status` in the directory to make this file executable.
4. Run the ReposCheck app.

# Credits
The script was created by [mzabriskie](https://gist.github.com/mzabriskie). You can view the original script [here](https://gist.github.com/mzabriskie/6631607)
