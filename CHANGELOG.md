<a name="0.9.2"></a>
# [](https://github.com/haysclark/adlmflexnetserver/compare/v0.9.1...0.9.2) (2017-01-19)

### Features
- new entrypoint.sh which makes custom service startup easier

<a name="0.9.1"></a>
## [0.9.1](https://github.com/haysclark/adlmflexnetserver/compare/v0.9.0...v0.9.1) (2017-01-18)

### Improvements
- Eliminating all default arguments to fix both the logging issues and removing all magical paths and values. Props to @hyperknot
- Updating documentation and examples to match current behavior. 

### BREAKING CHANGES
- Container no longer provides auto-magical license path, use -c [license_path] instead.
- Container no longer logs to __/var/log/flexlm/lmgrd.log__, use _docker logs_ instead.

<a name="0.9.0"></a>
# 0.9.0 (2016-10-10)

### Initial Release
- A Docker container for running _lmgrd_.
