class FormMincer < Formula
  desc "Package for massless three loop propagator-like integrals"
  homepage "http://www.nikhef.nl/~form/maindir/packages/mincer/mincer.html"
  url "http://www.nikhef.nl/~form/maindir/packages/mincer/mincer.h"
  version "20070206"
  sha256 "a79a0f6319b353c55a11f7f17e8b3456a8f0eac4689231bc061df198d96b9887"

  depends_on "form" => :run

  resource "testmincer1" do
    url "http://www.nikhef.nl/~form/maindir/packages/mincer/testmincer1.frm"
    sha256 "0f98ddeaeedb8c0c778332255fbb8c86f7aae6377ebc44ee202e27623d1a9e54"
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

  def install
    pkgformpath.install "mincer.h"

    resource("testmincer1").stage do
      pkgpath.install "testmincer1.frm"
    end
  end

  def caveats; <<-EOS.undent
    Add the following line to your .bashrc or .zshrc:
      export FORMPATH="$FORMPATH:$(brew --prefix)/share/form"
    EOS
  end

  def lhs(output, exprname, index = -1)
    matches = output.scan(/^[ \t]+#{Regexp.escape(exprname)}\s*=(.+?);/m)
    r = matches[index].first if !matches.empty? && !matches[index].nil?
    r.gsub(/\s+/, "") if !r.nil?
  end

  def rhs(str)
    str.gsub(/\s+/, "").chomp(";")
  end

  test do
    out = pipe_output("form -q -p #{formpath} #{pkgpath/"testmincer1.frm"}").
      lines.join
    assert_equal lhs(out, "F"), rhs("
       - 6695/5184 - 1/48*ep^-3 + 41/288*ep^-2 - 1541/6912*ep^-1 + 5/4*z5 - 1/
      6*z3;
    ")
  end
end
