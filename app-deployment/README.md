# App Deployment Using Win32 Content Prep Tool

## Overview

The Intune Management Extension (IME) is used to deploy Win32 applications to Intune. The IME allows applications or PowerShell scripts to be installed and run on targeted devices. A Win32 application will typically be a file with a _.exe_ or _.msi_ but Intune also allows the execution of _.ps1_, _.cmd_, and _.bat_ files for app or script installations.

## Prerequisities

Before beginning an app deployment, download the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). This tool facilitates the packaging of script and/or application files into a _.intunewin_ file which Intune can use. Once this is installed, you should create three folders:

1. C:\IntuneWinAppUtil : store the Content Prep Tool _.exe_ in here.
2. C:\IntuneSource : store your application packages in here (e.g. any installer files and installation scripts).
3. C:\IntuneApps : this will be the location the Content Prep Tool saves the resulting _.intunewin_ files to.

>[!NOTE]
> These folders can be created wherever you like, they don't have to be these exact paths. As long as you know where they are being stored, any location is generally fine. I would advise keeping them grouped in the same location for ease of access.

## General App Deployment Guide

For a full overview of deploying an app to Intune, please see my Wiki page [here](https://contrxl.gitbook.io/in-contrxl/intune/app-deployment).

This covers the entire process of app deployment, as well as App Updating & Patching. This repo will contain specific installation instructions for specific apps, whilst the Wiki will cover more generic concepts and processes.