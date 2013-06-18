package org.flexunit {
	import org.flexunit.async.AsyncSuite;
	import org.flexunit.cases.AssertCase;
	import org.flexunit.cases.AssertThatCase;
	import org.flexunit.cases.AssertionErrorCase;
	import org.flexunit.cases.AssumeCase;
	import org.flexunit.cases.AssumeThatCase;

	import org.flexunit.events.EventsSuite;
	import org.flexunit.experimental.ExperimentSuite;
	import org.flexunit.internals.InternalsSuite;
	import org.flexunit.reporting.ReportingSuite;
	import org.flexunit.runner.RunnerSuite;
	import org.flexunit.runners.RunnersSuite;
	import org.flexunit.token.TokenSuite;
	import org.flexunit.utils.UtilsSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class FlexUnit4FlexUnitSuite
	{
		//Suites
		public var asyncSuite:AsyncSuite;
		public var eventsSuite:EventsSuite;
		public var experimentalSuite:ExperimentSuite;
		public var internalSuite:InternalsSuite;
		public var reportingSuite:ReportingSuite;
		public var runnerSuite:RunnerSuite;
		public var runnersSuite:RunnersSuite;
		public var tokenSuite:TokenSuite;
		public var utilsSuite:UtilsSuite;
		
		//Cases
		public var assertCase:AssertCase;
		public var assertionErrorCase:AssertionErrorCase;
		public var assertThatCase:AssertThatCase;
		public var assumeCase:AssumeCase;
		public var assumeThatCase:AssumeThatCase;
	}
}