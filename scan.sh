TARGET=$1
if ! [ $TARGET ]; then
  echo "[!] No target provided."
  echo ">> $0 <example.com>"
  exit 1
fi
mkdir $TARGET
knockknock -n $TARGET -p

subfinder -dL domains.txt -silent | anew -q targets.txt
nuclei -id CVE-2022-26134 -l targets.txt -vv -o vulns.txt
