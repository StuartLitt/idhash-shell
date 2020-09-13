rm -rf iptable.txt
rm -rf table.txt
rm -rf tabletran.txt

hash="ac232a95f4723404115fd8f206aa29e8"
ip="200:5b19:8017:a074:b39a:7aae:4c5c:cd81"
echo "$ip" > $hash
echo "$ip" >> iptable.txt
echo "$hash" >> table.txt
echo "http://[$ip]:7777/table.sh" > tabletran.txt
