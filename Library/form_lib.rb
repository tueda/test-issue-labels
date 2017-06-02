require "formula"

class Formula
  def formbin
    # Example: form
    ENV["FORM"] || "form"
  end

  def formpath
    # Example: /usr/local/share/form
    share/"#{HOMEBREW_PREFIX/"share/form"}"
  end

  def pkgformpath
    # Example: /usr/local/Cellar/form-foo/0.1/share
    share/"form"
  end

  def pkgpath
    # Example: /usr/local/Cellar/form-foo/0.1/share/foo
    pkgformpath/"#{name.sub(/form-/, "")}"
  end

  def formpath_message; s = <<-EOS.undent
    Add the following line to your .bashrc or .zshrc:
      export FORMPATH="$FORMPATH:$(brew --prefix)/share/form"
    EOS
    s.chomp
  end

  def result(output, exprname, index = -1)
    matches = output.scan(/^[ \t]+#{Regexp.escape(exprname)}\s*=(.+?);/m)
    r = matches[index].first if !matches.empty? && !matches[index].nil?
    r.gsub(/\s+/, "") if !r.nil?
  end

  def expr(str)
    str.gsub(/\s+/, "").chomp(";")
  end
end
