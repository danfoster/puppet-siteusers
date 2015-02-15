# siteusers

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with siteusers](#setup)
    * [What siteusers affects](#what-siteusers-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with siteusers](#beginning-with-siteusers)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

A module for managing local users and groups via Hiera.

## Module Description

This module makes use of the `User` and `Group` resource types to create users that are defined in a Hiera data source.

## Setup

### What siteusers affects

* /etc/passwd
* /etc/group
* /etc/shadow


### Beginning with siteusers

Include `siteusers` to get started:

```
class { '::site' }
```

## Usage

Create you users and group in Hiera.

### Users


```
users:
  dan:
    uid: 1000
    gid: dan
    comment: Dan Foster
    groups:
      - group_A
      - group_B
    password: 'passwordhashhere'
```

### Groups

```
groups:
  group_A:
    gid: 2000
  group_B:
    gid: 2001
```

## Development

Pull requests are gratefully received.
