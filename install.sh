#!/bin/bash

# Check for Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Install GNU core utilities
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-which --with-default-names
brew install gnu-grep --with-default-names


PACKAGES=(
    mongodb-community
    mongodb-database-tools
    mongosh
    mysql@5.7
    php
    sqlite
    starship
    wget
    youtube-dl
)

echo "Installing packages..."
brew install ${PACKAGES[@]}
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    adobe-creative-cloud
    android-studio
    db-browser-for-sqlite
    docker
    dropbox
    font-hack-nerd-font
    google-chrome
    imageoptim
    iterm2
    microsoft-teams
    mongodb-compass
    mysqlworkbench
    notion
    pastebot
    postman
    sequel-pro
    slack
    spotify
    telegram
    transmit
    visual-studio-code
    vlc
    webex
    whatsapp
    xcodes
    yed
    zoom
    skype
)

echo "Installing cask application, pay attention for password requests"
brew cask install ${CASKS[@]}

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "I think we are done, get back to work!"