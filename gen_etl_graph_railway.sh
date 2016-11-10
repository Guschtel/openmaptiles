

ID=railway
DOT=${ID}.dot

echo "digraph G
{    
rankdir=LR;
" > $DOT

cat ./layers/${ID}/mapping.yaml | grep    "# etldoc:" |  sed 's/# etldoc://g'  >>$DOT

cat ./layers/${ID}/types.sql    | grep "\-\- etldoc:" |  sed 's/-- etldoc://g' >>$DOT
cat ./layers/${ID}/railway.sql  | grep "\-\- etldoc:" |  sed 's/-- etldoc://g' >>$DOT

echo "
}
" >> $DOT

cat $DOT

dot -Tpng $DOT > layer_${ID}_etl.png
