date "+Compiled: %Y/%m/%d %H:%M:%S" > version.txt
rm ../builds/loopyhero.love
zip -9 -r -x\.git/* ../builds/loopyhero.love .