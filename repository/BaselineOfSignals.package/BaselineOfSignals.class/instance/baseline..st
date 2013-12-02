baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		spec package: 'Signals'.
		spec group: 'default' with: #('Signals')].
		
	spec for: #squeak do: [
		spec project: 'OmniBrowser' with: [
			spec
				className: 'ConfigurationOfOmniBrowser';
				versionString: #stable;
				loads: #('Core');
				repository: 'http://www.squeaksource.com/MetacelloRepository'].
		
		spec project: 'AXAnnouncements' with: [
			spec
				className: 'ConfigurationOfAXAnnouncements';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].
		
		spec
			package: 'MethodWrappers' with: [
				spec repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/SwaUtilities'];
			package: 'SI-Wrapper' with: [spec requires: #('MethodWrappers' 'Signals')];
			package: 'SI-Reflection' with: [spec requires: #('Signals')];
			package: 'SI-OB-Morphic' with: [spec requires: #('OmniBrowser' 'Signals')];
			package: 'SI-Benchmarks' with: [spec requires: #('AXAnnouncements' 'SI-Wrapper' 'Signals')].

		spec
			group: 'dev' with: #('Signals' 'SI-Wrapper' 'SI-Reflection');
			group: 'full' with: #('Signals' 'SI-Wrapper' 'SI-Reflection' 'SI-OB-Morphic' 'SI-Benchmarks') ].