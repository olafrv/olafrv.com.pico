---
title: Extract ASCII (undescored) subject form MIME email files
link: https://www.olafrv.com/wordpress/extract-ascii-undescored-subject-form-mime-email-files/
author: chanchito
description: 
post_id: 825
created: 2011/12/20 11:17:57
created_gmt: 2011/12/20 15:47:57
comment_status: open
post_name: extract-ascii-undescored-subject-form-mime-email-files
status: publish
post_type: post
---

# Extract ASCII (undescored) subject form MIME email files

#!/usr/bin/perl
    
    ##
    # FILE: email-subject.pl
    # AUTHOR: Olaf Reitmaier  - Dec 20th, 2011
    # USE: Extract ASCII (undescored) subject form MIME email files
    # TEST: find . -maxdepth 1 -name '*.eml'  | xargs -n1 perl email.pl
    ###
    
    use MIME::Parser;
    use Data::Dumper;
    use MIME::WordDecoder;
    use Encode;
    
    my $parser = new MIME::Parser;
    
    $mime_tmp_dir = "$ENV{HOME}/mimemail";
    
    
    if (-d $mime_tmp_dir){
    	$parser->output_under($mime_tmp_dir);
    }else{
    	print "You must create mimemail/ dir!\n";
    	exit(1);
    }
    #$entity = $parser->parse(\*STDIN) or die "parse failed\n";
    $entity = $parser->parse_open($ARGV[0]);
    
    #$entity->dump_skeleton;
    
    $subject = unmime $entity->head->get('subject');
    $date = unmime $entity->head->get('date');
    
    $subject=~s/\P{IsASCII}/_/g;
    $subject=~s/\s/_/g;
    $subject=~s/_$//;
    
    $date=~s/\P{IsASCII}/_/g;
    $date=~s/\s/_/g;
    $date=~s/^.*,_//;
    $date=~s/_$//;
    
    print "$date-$subject.eml\n";