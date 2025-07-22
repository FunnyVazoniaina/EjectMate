# EjectMate

## Project Description

EjectMate is a simple and efficient batch script project designed to automatically detect and safely eject any USB removable drives connected to a Windows system. It eliminates the need for users to manually specify drive letters, making USB ejection faster and less error-prone. The project aims to provide a lightweight solution for quick USB device management.

## Features

- Automatically detects all connected USB drives  
- Ejects USB drives safely using PowerShell  
- Provides success or error notifications via BurntToast  
- Handles multiple USB drives in a single run  
- Clear success/failure messages in terminal with colors  
- Ready to convert into `.exe` for portable use  

## How It Works

The script uses Windows built-in `diskpart` and `powershell` commands to list all removable drives, identify USB devices, and then safely eject each one. It loops through all detected USB drives and issues the eject command accordingly.

## Usage

1. Connect your USB removable drives.
2. Run the batch script with administrator privileges.
3. The script will automatically detect and eject all connected USB drives.

## Requirements

- Windows operating system.
- Run the script with administrator rights.
- Basic knowledge of running batch files.
- Windows PowerShell  
- [BurntToast](https://www.powershellgallery.com/packages/BurntToast) PowerShell module (for toast notifications)  

## Contribution

Contributions and suggestions are welcome. Feel free to open issues or submit pull requests to improve the project.

## Installation

1. Clone or download this repository.  
2. Install BurntToast (only once):

   ```powershell
   Install-Module -Name BurntToast -Force -SkipPublisherCheck

## License

This project is licensed under the MIT License.

## Author
------
Developed by Funny Vazoniaina as a personal utility project.