## Development Guidelines

## Branching Concept
* **master** Master Branch. Productive use. Should not be pushed directly. Only update the master branch by doing a merge from the dev branch. (No matter how small the changes are.) 
* **dev**  Development Branch. For testing of overall system. Default branch of HSA Lab.
* **feature/feature_name** Feature branches. Every new feature (in development) should have its own branch. If the feature is ready and tested, the code can be merged to dev and the featurebranch can be deleted.

## Commits
We try to use [these](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716) semantic commit messages.

## Testing
Not having all Measurement Devices at hand makes unit testing impossible, BUT
all functionality must have a get and set method, to verify that the communication and configuration of the device works as intended.

## Naming
There is no restriction in length for function or class names.
Do not use abbreviations except for the following.

List abbreviations that **must** be used:
* `Freq` for Frequency
* `Meas` for Measurement
* `Eth` for Ethernet

### Naming of Devices:
Format: `Vendor_Device' 

_Examples: 
* RhodeUndSchwarz_SMX
* RadiSense_EFieldProbe4
* UASAugsburg_Stepper_

### Name of Functions:
Abstract Classes should be used as often as possible to ensure the same names for same functions over all devices.
get/set methods should always start with set and get, respectivly.

_Examples: 
* setVoltage()
* setCurrent()
* setFreq()
* getIntermediateFreqBandwidth()_

### Parameters:
All Parameters are in SI Units.

_Example: 
* Hz
* seconds_


