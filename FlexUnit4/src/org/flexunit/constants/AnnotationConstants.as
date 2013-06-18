/**
 * Copyright (c) 2010 Digital Primates
 * 
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author     Michael Labriola 
 * @version    
 **/ 
package org.flexunit.constants {
	public class AnnotationConstants {
		/**
		 * Annotation constant used with the Theory runner to indicate a single piece of 
		 * data to be provided to a theory.
		 */
		public static const DATA_POINT:String = "DataPoint";

		/**
		 * Annotation constant used with the Theory runner to indicate an array of 
		 * data to be provided to a theory.
		 */
		public static const DATA_POINTS:String = "DataPoints";
		
		/**
		 * Annotation constant used with the Theory runner to indicate a given test is a Theory
		 */
		public static const THEORY:String = "Theory";

		/**
		 * Annotation constant used with the Parameterized runner to indicate an array of 
		 * data to be provided to a test's constructor.
		 */
		public static const PARAMETERS:String = "Parameters";
		
		/**
		 * Annotation constant used with the Suite Runner
		 */
		public static const SUITE:String = "Suite";

		/**
		 * Annotation constant used with all runners to indicate a Test to be executed
		 */
		public static const TEST:String = "Test";

		/**
		 * Annotation constant used with classes that implement IMethodRule indicating that
		 * this particular class should be executed as a Rule, wrapping the test.
		 */
		public static const RULE:String = "Rule";

		/**
		 * Annotation constant used to mark a method or methods that should run before the
		 * execution of each test.
		 */
		public static const BEFORE:String = "Before";
		/**
		 * Annotation constant used to mark a method or methods that should run after the
		 * execution of each test.
		 */
		public static const AFTER:String = "After";

		/**
		 * Annotation constant used to mark a method or methods that should run before the
		 * first instantiation of a class containing tests
		 */
		public static const BEFORE_CLASS:String = "BeforeClass";
		/**
		 * Annotation constant used to mark a method or methods that should run after the
		 * completion of all tests in a class.
		 */
		public static const AFTER_CLASS:String = "AfterClass";
		
		/**
		 * Annotation constant used to mark a method or class as ignored. The interface will
		 * not the existance of this method or class but not attempt to execute it
		 */
		public static const IGNORE:String = "Ignore";
		
		/**
		 * Annotation constant used to change the default runner for a test class.
		 */
		public static const RUN_WITH:String = "RunWith";

		/**
		 * Annotation constant used to specify the data type of items in an array.
		 */
		public static const ARRAY_ELEMENT_TYPE:String = "ArrayElementType";
	}
}