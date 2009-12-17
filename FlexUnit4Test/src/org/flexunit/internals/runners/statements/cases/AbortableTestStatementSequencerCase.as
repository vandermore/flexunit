package org.flexunit.internals.runners.statements.cases
{
	import org.flexunit.Assert;
	import org.flexunit.Assume;

	public class AbortableTestStatementSequencerCase
	{
		
		[BeforeClass]
		public static function preClassSetUp() : void
		{
			trace("Before Class is going to fail.");
			Assume.assumeTrue( false );
			//Assert.fail("This BeforeClass is set up to fail.");
		}
		
		[Before]
		public function setUp() : void
		{
			trace("Set Up is going to fail.");
			//Assert.fail("This Before is set up to fail.");
			Assume.assumeTrue( false );
		}
		
		[Before]
		public function setUp2() : void
		{
			trace("Set Up 2 is going to fail.");
			//Assert.fail("This Before is set up to fail.");
			Assume.assumeTrue( false );
		}
		
		[Test]
		public function testSampleMethod():void
		{
			//Assert.assertTrue("Test method Not yet implemented");
			trace("Test Sample Method called");
			Assert.fail("Test Before Breaking Failure");
			//Assert.assertEquals(5, 5);
		}
		
		[Test]
		public function anotherTestSampleMethod():void
		{
			trace("Another Test Sample Method called");
			Assert.assertTrue("Test method Not yet implemented");
			//Assert.assertEquals(5, 5);
		}
		
		[After]
		public function breakDown() : void
		{
			//Assert.fail("This After is set up to fail.");
			trace("Break Down called");
			Assume.assumeTrue( false );
		}
		
		[AfterClass]
		public static function postClassBreakDown() : void
		{
			trace("After Class is going to fail.");
			Assert.assertEquals(5, 6);
		}
	}
}