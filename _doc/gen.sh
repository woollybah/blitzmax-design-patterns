cd ..
for i in `find . -name "*.plantuml"`;do
 dir=`dirname $i`
 cd $dir
 java -jar ../../_doc/plantuml.jar *.plantuml
 cd -
done
