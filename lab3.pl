#!perl

#name: Karina Bercan

#######################################
# Instructions
#
# The names, phone numbers, and locations
# below are correct, but they are not in the 
# right format.  Use regular expressions and 
# back references to reorganize the information 
# into this format:
#
# Last name, First name Middle Initial
# location
# (xxx) xxx-xxxx
# 
# print the re-organized information to show 
# that it is correct.
#######################################

push @contact, "Kiayada D. Levy,(570)7924192,Sint-Laureins-Berchem";
push @contact, "Gretchen F. Manning,(1-656)-285-0869,Spoleto";
push @contact, "Ashton Richards,(974) 843-9297,Annapolis Royal";
push @contact, "Demetrius J. Ferguson,1-906-206-4323,Rea";
push @contact, "Blair Nelson,1-121-171-3665,Bertiolo";
push @contact, "Cynthia J. Farley,632 691 2180,Moen";
push @contact, "Nayda M. Lloyd,1-864-250-6977,Sarre";
push @contact, "Miranda Edith Sexton,1-597-689-8316,Shipshaw";
push @contact, "Fulton Mays,(725)789-9517,Pierrefonds";
push @contact, "Shea Kim,1-697-854-4139,Bihain";
push @contact, "Emma-Mae Winters,1-137-630-5601,Gulfport";
push @contact, "Inez W. Depew,1-833-470-5664,Johnstone";
push @contact, "Darrel F. Key,1-878-918-2161,Olympia";
push @contact, "Tobias L. Stephens,1-119-939-6704,Unnao";
push @contact, "Elmo Pate,1-869-333-7341,Griesheim";

print("\n\nThis is the format:\nLast name, First name Middle Initial\nlocation\n(xxx) xxx-xxxx\n\n");

foreach $person (@contact){
    @p = split(",",$person);

    # format name
    if($p[0]=~m/([\w\-\.]*)\s([\w\-\.]*)\s([\w\-\.]*)/g){
        $first = $1;
        $mid = $2;
        $last = $3;
    }
    else{
        $p[0]=~m/([\w\-]*)\s([\w\-]*)/;
        $first = $1;
        $mid = "";
        $last = $2;
    }

    # format location
    $p[2]=~m/([\w\-\s]*)/i;
    $loc = $1;

    # format phone
    $p[1]=~s/[^\d]//g;
    if(length $p[1] == 10){
        $p[1]=~m/(\d{3})(\d{3})(\d{4})/;
        $area = $1;
        $central = $2;
        $tele = $3;
    }
    else{
        $p[1]=~m/\d(\d{3})(\d{3})(\d{4})/;
        $area = $1;
        $central = $2;
        $tele = $3;
    }

    print($last.", ".$first." ".$mid."\n".$loc."\n");
    print("(".$area.") ".$central."-".$tele."\n\n");
}

