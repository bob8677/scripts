#!/bin/fish

set dir '.playlist'


switch $argv[1]
case -d;
	echo download $argv[2]
	ls $dir > /dev/null || mkdir $dir
	rm $dir/*
	spotdl -p $argv[2] --write-to $dir/tmp.txt || exit 1
	echo $argv[2] > $dir/url

	spotdl -l $dir/tmp.txt -w $dir/songs

	rm $dir/tmp.txt
case -u; 
	echo update;
	cat $dir/songs $dir/url > /dev/null || exit 1
	mv $dir/songs $dir/songs-old
	spotdl -p (cat $dir/url) --write-to $dir/songs || exit 1

	sort $dir/songs-old $dir/songs-old $dir/songs | uniq -u > $dir/tmp.txt

	[ (du .playlist/tmp.txt | awk '{print $1}') = 0 ] || spotdl -l $dir/tmp.txt -w $dir/succsessful

	for song in (sort $dir/songs-old $dir/songs $dir/songs | uniq -u)
		rm (echo "import spotdl; spotdl.authorize.services.AuthorizeSpotify('4fe3fecfe5334023a1472516cc99d805','0f02b7c483c04257984695007a4a8d5c'); a=spotdl.command_line.core.MetadataSearch('$song').on_spotify(); print(a['artists'][0]['name'] + ' - ' +  a['name'] + \".mp3\")" | python3)
	end

	sort $dir/songs-old $dir/succsessful > $dir/songs

	rm $dir/songs-old $dir/tmp.txt
end
