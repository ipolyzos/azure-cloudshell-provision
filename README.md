# Azure Cloud Shell Setup 

## Overview

 A shell script to automate the Azure Cloud Shell environment.

## Components

 In Azure Cloud Shell we expect dependencies of `zsh` shell and `kubectl` CLI to be already installed. The components installed and configured on top of them are:

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Krew](https://github.com/kubernetes-sigs/krew) - Kubectl package manager
- [Linkerd](https://linkerd.io/) CLI 

## Install

 In order to install in your Azure Cloud Shell you should use the `init.sh` script. For example in order to invoke from http you can use the command below:
 ```
 curl -s https://raw.githubusercontent.com/ipolyzos/azure-cloudshell-setup/master/init.sh | bash
 ```
 

## License
```
MIT License

Copyright (c) 2019-2020 Ioannis Polyzos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```