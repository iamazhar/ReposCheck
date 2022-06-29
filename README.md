# ReposCheck
A very simple macOS utility app to check if mutliple repos within `/Documents/GitHub` or a user specified directory path have any modified files. You can also specify your own path for the `repos-status.sh` script.
The UI is built using SwiftUI.

Dark             |  Light
:-------------------------:|:-------------------------:
![](https://github.com/iamazhar/ReposCheck/blob/main/preview-dark.png)  |  ![](https://github.com/iamazhar/ReposCheck/blob/main/preview-light.png)

# Setup
1. Add repos you want to track inside `/Documents/GitHub`.
2. Add the `repos-status.sh` script file to above directory.
3. Run command `chmod 777 git-status` in the directory to make this file executable.
4. Run the ReposCheck app.

# Credits
The script was created by [mzabriskie](https://gist.github.com/mzabriskie). You can view the original script [here](https://gist.github.com/mzabriskie/6631607)
