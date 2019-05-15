# Natural String Sorting
This is a demonstration project of how to sort strings with proper number ordering rather than the standard algorithms provided by most programming languages. Note that this code was not very well tested and might contain bugs or other performance issues. If you intend to implement it in your application use at your own risk.

Example:
 * `My String 12 Review`
 * `My String 12 Audio`
 * `My String 10 Other Test Magic`
 * `My String 10 Other Magic`
 * `My String 10 Test Text`
 * `My String 10 Test Text 11 Inner String 14`
 * `My String 10 Test Text 11 Inner String 13`
 * `My String 10 Test Text 2 Inner String 10000`
 * `My String 10 Test Text 2 Inner String 99`
 * `My String 7`
 * `My String 2`
 * `My String 11`
 * `My String 10 Test Text 11 Inner String 1`

Will be sorted as:
 * `My String 2`
 * `My String 7`
 * `My String 10 Test Text`
 * `My String 10 Test Text 2 Inner String 99`
 * `My String 10 Test Text 2 Inner String 10000`
 * `My String 10 Test Text 11 Inner String 1`
 * `My String 10 Test Text 11 Inner String 13`
 * `My String 10 Test Text 11 Inner String 14`
 * `My String 10 Other Magic`
 * `My String 10 Other Test Magic`
 * `My String 11`
 * `My String 12 Audio`
 * `My String 12 Review`