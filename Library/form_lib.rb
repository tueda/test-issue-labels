require "formula"

class Formula
  # FORM excutable for running tests.
  # Example: form
  def formbin
    ENV["FORM"] || "form"
  end

  # $FORMPATH for brewed form packages.
  # Example: /usr/local/share/form
  def formpath
    share/"#{HOMEBREW_PREFIX/"share/form"}"
  end

  # $FORMPATH for each form package, linked to "formpath".
  # Example: /usr/local/Cellar/form-foo/0.1/share/form
  def pkgformpath
    share/"form"
  end

  # A directory that may be used to place extra files for each package.
  # Example: /usr/local/Cellar/form-foo/0.1/share/form/foo
  def pkgpath
    pkgformpath/"#{name.sub(/form-/, "")}"
  end

  # FORMPATH message for "caveats" of each formula.
  def formpath_message; s = <<-EOS.undent
    Add the following line to your .bashrc or .zshrc:
      export FORMPATH=$FORMPATH:$(brew --prefix)/share/form
    EOS
    s.chomp
  end

  # Extract a printed expressions in FORM output.
  def result(output, exprname, index = -1)
    matches = output.scan(/^[ \t]+#{Regexp.escape(exprname)}\s*=(.+?);/m)
    r = matches[index].first if !matches.empty? && !matches[index].nil?
    r.gsub(/\s+/, "") if !r.nil?
  end

  # String representation of an expression to be compared with a return-value of
  # "result"
  def expr(str)
    str.gsub(/\s+/, "").chomp(";")
  end
end
