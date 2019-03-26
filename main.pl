use constant FILE_SUFFIX => "js";

use constant INDEX_CONTENT => 
"import actions from './actions'
import mutations from './mutations'
import getters from './getters'  

const state = {

}
    
export default {
    namespaced: true,
    actions,
    mutations,
    state,
    getters
}";

use constant EMPTY_EXPORT => "export default {}";
use constant MUTATIONS_CONTENT => EMPTY_EXPORT;
use constant ACTIONS_CONTENT => EMPTY_EXPORT;
use constant GETTERS_CONTENT => EMPTY_EXPORT;

my @contents = (
  INDEX_CONTENT,
  MUTATIONS_CONTENT,
  GETTERS_CONTENT,
  ACTIONS_CONTENT
);

my @questions = (
  'index name (index.js):',
  'mutation name (mutations.js): ',
  'getters name (getters.js): ',
  'actions name (actions.js): ',
);

my @file_default_name = (
  'index',
  'mutations',
  'getters',
  'actions'
);


my %cli_texts = ();
my %file_content = ();

for($index = 0;$index < scalar @questions;$index++){
  my $filename = $file_default_name[$index];
  my $question = $questions[$index];
  my $content = $contents[$index];

  $cli_texts{$question} = $filename;
  $file_content{$filename} = $content;
}

foreach $key (keys %cli_texts){
  print $key;
  my $filename = <>;

  unless($filename == ""){
    $cli_texts{$key} = $filename;
  }
}

foreach $key (keys %cli_texts){
  my $filename = $cli_texts{$key};
  my $content = $file_content{$filename};

  open file, "+>$filename." . FILE_SUFFIX or die "cannot open this file";
  print file $content;
}
