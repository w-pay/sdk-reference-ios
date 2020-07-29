import Foundation
import Hamcrest

func blankOrNilString() -> Matcher<String?> {
	anyOf(nilValue(), equalTo(""))
}