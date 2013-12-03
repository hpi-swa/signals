| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Metacello new
  baseline: 'Signals';
  repository: 'filetree://', gitPath, '/signals/repository';
  get.

Metacello new
  baseline: 'Signals';
  repository: 'filetree://', gitPath, '/signals/repository';
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfSignals' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

