with import <nixpkgs> {};
mkShell {
    buildInputs = [
        (with ocaml-ng.ocamlPackages_4_07; [
            cohttp
            conduit
            findlib
            lwt4
            ocaml
            ocp-indent
        ])
        rlwrap
        shellcheck
    ];
    shellHook = ''
        . .shellhook
    '';
}
