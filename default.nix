{ stdenv, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kine";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "k3s-io";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-zFjT3Ngt8v37qv25N4UNv3xm3Ss4SGf68B9nu09LiWg=";
  };

  buildFlagsArray = [
    "-ldflags=-X github.com/k3s-io/kine.Version=v${version} -X github.com/k3s-io/kine.GitCommit=0000000"
  ];

  subPackages = [ "." ];
  vendorSha256 = "sha256-Me9Vn/ivTXJgnx9/sngcN5ixWKhxvq46a+kmk2fu2V4=";

  meta = with lib; {
    description = "Kine is an etcdshim that translates etcd API to sqlite, Postgres, Mysql, and dqlite";
    homepage = "https://github.com/k3s-io/kine";
    license = licenses.asl20;
    maintainers = with maintainers; [ mikroskeem ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
