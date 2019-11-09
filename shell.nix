with import <nixpkgs> {};
mkShell {
    buildInputs = [
        (with ocaml-ng.ocamlPackages_4_08; [
            findlib
            lwt4
            ocaml
            ocp-indent
        ])
        shellcheck
    ];
    shellHook = ''
        . .shellhook
    '';
}
