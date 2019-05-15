import haxe.ds.ArraySort;

class Main {
	static function compare(a:Null<Int>, b:Null<Int>):Int {
		if (a < b)
			return -1;
		else if (a > b)
			return 1;
		else
			return 0;
	}

	/**
	 * Sorts an Array<String> by the natural ordering of strings.
	 * For instance "Test 9", "Test 1", "Test 11" would be ordered
	 * "Test 1", "Test 9", "Test 11" rather than the standard sort
	 * methods provided by the programming language.
	 * @param strings Array<String> to sort.
	 */
	static function naturalSort(strings:Array<String>) {
		var foundNumber:Array<Int> = [];
		var stringParts:Array<String> = [];
		var sortstrings:Array<Array<String>> = [];
		var retstrings:Array<String> = [];

		var clearArray = function(array:Array<Dynamic>) {
			while (array.length > 0)
				array.pop();
		}

		for (str in strings) {
			for (index in 0...str.length) {
				var charcode = str.charCodeAt(index);

				if (charcode >= 48 && charcode <= 57) {
					foundNumber.push(charcode);
				} else {
					if (foundNumber.length > 0) {
						var newValue = [for (i in foundNumber) String.fromCharCode(i)].join("");
						stringParts.push(newValue);
						clearArray(foundNumber);
					}

					stringParts.push(String.fromCharCode(charcode));
				}
			}

			if (foundNumber.length > 0) {
				var newValue = [for (i in foundNumber) String.fromCharCode(i)].join("");
				stringParts.push(newValue);
				clearArray(foundNumber);
			}

			sortstrings.push(stringParts);
			stringParts = [];
		}

		ArraySort.sort(sortstrings, function(a:Array<String>, b:Array<String>):Int {
			var minLength = a.length < b.length ? a.length : b.length;
			for (index in 0...minLength) {
				if (a[index] == b[index])
					continue;

				var aInt:Null<Int> = Std.parseInt(a[index]);
				var bInt:Null<Int> = Std.parseInt(b[index]);
				if (aInt != null && bInt != null) { // If the string is an actual number, compare the numbers not the strings.
					return compare(aInt, bInt);
				} else { // Compare the strings.
					return compare(a[index].charCodeAt(0), b[index].charCodeAt(0));
				}
			}
			return 0;
		});

		for (p in sortstrings) {
			var newstring = [for (i in p) i].join("");
			retstrings.push(newstring);
		}

		return retstrings;
	}

	static function main() {
		var strings = new Array<String>();
		strings.push("My String 12 Review");
		strings.push("My String 12 Audio");
		strings.push("My String 10 Your Mother");
		strings.push("My String 10 Your Cats Mother");
		strings.push("My String 10 Test Text");
		strings.push("My String 10 Test Text 11 Inner String 14");
		strings.push("My String 10 Test Text 11 Inner String 13");
		strings.push("My String 10 Test Text 2 Inner String 10000");
		strings.push("My String 10 Test Text 2 Inner String 99");
		strings.push("My String 7");
		strings.push("My String 2");
		strings.push("My String 11");
		strings.push("My String 10 Test Text 11 Inner String 1");

		strings = naturalSort(strings);
		for (str in strings) {
			trace('output=$str');
		}
	}
}
