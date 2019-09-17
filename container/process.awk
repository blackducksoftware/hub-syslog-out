BEGIN {

if (host == "")
  host="127.0.0.1"
if (port == "") 
  port = 514
if (protocol == "")
  protocol = "TCP"


print "# Destination setup"
print "*.*  action(type=\"omfwd\" target=\""host"\" port=\""port"\" protocol=\""protocol"\""
print "            action.resumeRetryCount=\"100\""
print "            queue.type=\"linkedList\" queue.size=\"10000\")"
print 
print "module(load=\"imfile\" PollingInterval=\"10\")"
print

}

/\*.log/ {

arraylen=split($0,array,"/")
#print arraylen
#print array[arraylen-1]
tag=array[arraylen-2] "-" array[arraylen-1]
#print tag
#print length(tag)
#print substr(tag,0, 31)
print "#"
print "# Source setup for "$0
print "#"
print "input(type=\"imfile\" File=\""$0"\""; 
print "Tag=\"" substr(tag,0, 31) "\"" 
print "PersistStateInterval=\"10\""
print "Severity=\"debug\"" 
print "Facility=\"local7\")"
}

