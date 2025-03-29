# Linux/macOS Configuration Files

A collection of personalized configuration files for various command-line tools and environments on Linux and macOS systems.

## What's Included

- `.vimrc` - Vim text editor configuration with syntax highlighting, keybindings, and Python IDE setup
- `.bashrc` - Bash shell configuration with useful aliases, functions, and prompt customization
- `.screenrc` - GNU Screen terminal multiplexer configuration with status bar and scrollback settings
- `.bash_profile` - Profile configuration that sources `.profile` and `.bashrc`

## Features

### Vim Configuration (`.vimrc`)
- Syntax highlighting and code folding
- Custom keybindings (`,` as leader key, `jj` to escape insert mode)
- Python IDE features with Jedi integration
- File navigation with CtrlP
- Automatic whitespace cleanup
- Split window navigation with Ctrl+hjkl

### Bash Configuration (`.bashrc`)
- Useful aliases for common commands
- Git and Perforce branch information in prompt
- File extraction helper function
- JSON and XML pretty printing functions
- Command history search with up/down arrows
- Vi mode for command line editing

### Screen Configuration (`.screenrc`)
- Custom status bar with useful information
- Large scrollback buffer (50,000 lines)
- 256 color support

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/udaykiranm/config.git
   ```

2. Create symbolic links to the configuration files in your home directory:
   ```bash
   ln -s /path/to/config/.vimrc ~/.vimrc
   ln -s /path/to/config/.bashrc ~/.bashrc
   ln -s /path/to/config/.screenrc ~/.screenrc
   ln -s /path/to/config/.bash_profile ~/.bash_profile
   ```

3. For Vim plugins, set up Pathogen as mentioned in the `.vimrc` file:
   ```bash
   mkdir -p ~/.vim/autoload ~/.vim/bundle
   curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
   ```

4. Install recommended Vim plugins:
   ```bash
   cd ~/.vim/bundle
   git clone git://github.com/Lokaltog/vim-powerline.git
   git clone git://github.com/davidhalter/jedi-vim.git
   git clone git://github.com/kien/ctrlp.vim.git
   ```

## Customization

Feel free to modify these configuration files to suit your preferences. The files are well-commented to help you understand what each setting does.

## License

This project is open-source and available for anyone to use and modify.
