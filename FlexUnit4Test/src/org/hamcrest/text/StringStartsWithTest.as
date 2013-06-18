package org.hamcrest.text
{
    import org.hamcrest.*;
    import org.hamcrest.core.*;

    import org.flexunit.Assert;

    public class StringStartsWithTest extends AbstractMatcherTestCase
    {
        private static const EXCERPT:String = "EXCERPT";

        private var stringStartsWith:Matcher;
        private var stringStartsWithIgnoreCase:Matcher;

        [Before]
        public function setUp():void
        {
            stringStartsWith = startsWith(EXCERPT);
            stringStartsWithIgnoreCase = startsWith(EXCERPT, true);
        }

        [Test]
        public function evaluatesToTrueIfArgumentContainsSpecifiedSubstring():void
        {
            assertMatches("should be true if excerpt at beginning",
                stringStartsWith, EXCERPT + "END");

            assertDoesNotMatch("should be false if excerpt at end",
                stringStartsWith, "START" + EXCERPT);

            assertDoesNotMatch("should be false if excerpt in middle",
                stringStartsWith, "START" + EXCERPT + "END");

            assertMatches("should be true if excerpt is at beginning and repeated",
                stringStartsWith, EXCERPT + EXCERPT);

            assertDoesNotMatch("should be false if excerpt is not in string",
                stringStartsWith, "Something else");

            assertDoesNotMatch("should be false if part of excerpt is at start of string",
                stringStartsWith, EXCERPT.substring(1));
        }
        
        [Test]
        public function evaluatesToTrueIfArgumentContainsSpecifiedSubstringIgnoringCase():void
        {
            assertMatches("should be true if excerpt at beginning",
                stringStartsWithIgnoreCase, 
                EXCERPT.toLowerCase() + "END");

            assertDoesNotMatch("should be false if excerpt at end",
                stringStartsWithIgnoreCase, 
                "START" + EXCERPT.toLowerCase());

            assertDoesNotMatch("should be false if excerpt in middle",
                stringStartsWithIgnoreCase, 
                "START" + EXCERPT.toLowerCase() + "END");

            assertMatches("should be true if excerpt is at beginning and repeated",
                stringStartsWithIgnoreCase, 
                EXCERPT.toLowerCase() + EXCERPT);

            assertDoesNotMatch("should be false if excerpt is not in string",
                stringStartsWithIgnoreCase, 
                "Something else");

            assertDoesNotMatch("should be false if part of excerpt is at start of string",
                stringStartsWithIgnoreCase, 
                EXCERPT.toLowerCase().substring(1));
        }

        [Test]
        public function evaluatesToTrueIfArgumentIsEqualToSubstring():void
        {
            assertMatches("should be true if excerpt is entire string",
                stringStartsWith, EXCERPT);
        }

        [Test]
        public function hasAReadableDescription():void
        {
            assertDescription("a string starting with \"EXCERPT\"", stringStartsWith);
        }
    }
}
