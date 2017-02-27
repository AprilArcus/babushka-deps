# https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#comment-2508208541

require 'tempfile'

def has_italic_escape_codes? terminfo
  terminfo =~ /sitm=/
end

def add_italic_escape_codes terminfo
  [terminfo, "\tsitm=\033[3m,", "\tritm=\033[23m,"].join("\n")
end

def has_correct_backspace? terminfo
  terminfo !~ /kbs=\^H/
end

def fix_backspace terminfo
  terminfo.sub(/kbs=\^H/, 'kbs=\\\\177')
end
  
def has_terminfo? source
  shell? "infocmp #{source}"
end

def get_terminfo source
  shell "infocmp -1 #{source}"
end

# OS X and Arch ship an ancient version of `tic` which does not support
# reading from standard IO, so we have to use temp files. Fortunately, Ruby's
# tempfile class makes this relatively painless.
#
# c.f. https://groups.google.com/d/msg/osv-dev/aPXzoWe3E-M/53FVM_ceHjAJ

def write_terminfo terminfo
  tempfile = Tempfile.new 'terminfo'
  begin
  	tempfile.write terminfo
  ensure
  	tempfile.close
  	shell "tic -x #{tempfile.path}"
  	tempfile.unlink
  end
end

dep 'terminfo - xterm-256color exists' do
  met? { has_terminfo? 'xterm-256color' }
end

dep 'terminfo - xterm-256color has italics' do
  requires 'terminfo - xterm-256color exists'
  met? do
  	has_italic_escape_codes? get_terminfo('xterm-256color')
  end
  meet do
    terminfo = get_terminfo 'xterm-256color'
    italicized = add_italic_escape_codes terminfo
    write_terminfo italicized
  end
end

dep 'terminfo - xterm-256color has correct backspace' do
  requires 'terminfo - xterm-256color exists'
  met? do
    has_correct_backspace? get_terminfo('xterm-256color')
  end
  meet do
    terminfo = get_terminfo 'xterm-256color'
    italicized = fix_backspace terminfo
    write_terminfo italicized
  end
end

dep 'terminfo - screen-256color exists' do
  met? { has_terminfo? 'screen-256color' }
end

dep 'terminfo - screen-256color has italics' do
  requires 'terminfo - screen-256color exists'
  met? do
  	has_italic_escape_codes? get_terminfo('screen-256color')
  end
  meet do
    terminfo = get_terminfo 'screen-256color'
    italicized = add_italic_escape_codes terminfo
    write_terminfo italicized
  end
end

dep 'terminfo - screen-256color has correct backspace' do
  requires 'terminfo - screen-256color exists'
  met? do
    has_correct_backspace? get_terminfo('screen-256color')
  end
  meet do
    terminfo = get_terminfo 'screen-256color'
    italicized = fix_backspace terminfo
    write_terminfo italicized
  end
end

dep 'terminfo - tmux exists' do
  requires 'terminfo - screen-256color exists'
  met? { has_terminfo? 'tmux' }
  meet do
    terminfo = get_terminfo 'screen-256color'
    renamed = terminfo
      .gsub('screen-256color', 'tmux')
      .gsub('GNU Screen with 256 colors', 'tmux terminal multiplexer')
    write_terminfo renamed
  end
end

dep 'terminfo - tmux has italics' do
  requires 'terminfo - tmux exists'
  met? do
  	has_italic_escape_codes? get_terminfo('tmux')
  end
  meet do
    terminfo = get_terminfo 'tmux'
    italicized = add_italic_escape_codes terminfo
    write_terminfo italicized
  end
end

dep 'terminfo - tmux has correct backspace' do
  requires 'terminfo - tmux exists'
  met? do
    has_correct_backspace? get_terminfo('tmux')
  end
  meet do
    terminfo = get_terminfo 'tmux'
    italicized = fix_backspace terminfo
    write_terminfo italicized
  end
end

dep 'terminfo has italics' do
  requires 'terminfo - xterm-256color has italics'
  requires 'terminfo - screen-256color has italics'
  requires 'terminfo - tmux has italics'
end

dep 'terminfo has correct backspace' do
  requires 'terminfo - xterm-256color has correct backspace'
  requires 'terminfo - screen-256color has correct backspace'
  requires 'terminfo - tmux has correct backspace'
end
