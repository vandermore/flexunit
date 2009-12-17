package org.flexunit.internals.runners.statements
{
	import org.flexunit.internals.runners.ChildRunnerSequencer;
	import org.flexunit.token.ChildResult;

	public class AbortableTestStatementSequencer extends StatementSequencer implements IAsyncStatement
	{
		/**
		 * Evaluates the provided <code>child</code> if the <code>child</code> is an 
		 * <code>IAsyncStatement</code>.
		 * 
		 * @param child The child object to be evaluated.
		 */
/*		override protected function executeStep( child:* ):void {
			if ( child is IAsyncStatement ) {
				
				//If we have errors already, and the child is the test method, then don't run the test method.
				//if ( errors && errors.length > 0 && ( child is StackAndFrameManagement ) )
				//{
					//trace("We should not be running the main Test right now.");
					//sendComplete();
					//return;
				//}
				//} else {
				IAsyncStatement( child ).evaluate( myToken );
				//}
			}
		}
*/
		/**
		 * Determine if any errors were encountered for a potential statement that has just run and returned the
		 * provided <code>result</code>.  If an error was encountered during the last statement, add that error to
		 * a list of errors encountered in every statement in the sequencer.<br/>
		 * 
		 * If there are still statements that need to be evaluated, execute the first unexecuted step in the sequence.
		 * Otherwise, if all statements have finished running, the <code>StatementSequencer</code> has finished and will
		 * report any errors that have been encoutnred.
		 * 
		 * @param result A potential <code>ChildResult</code> that was encountered during the execution of the
		 * previous statement.
		 */
		override public function handleChildExecuteComplete( result:ChildResult ):void {
			var step:*;
			
			if ( result && result.error ) {
				errors.push( result.error );
			}
			
			if ( queue.length > 0 ) {
				
				//TODO:: I don't like how this works right now, since we probably shouldn't be depending on the queue length, or the StackAndFrameManagement / ChildRunnerSequencer types to determine if we should be aborting.
				if ( errors && errors.length > 0 && ( ( queue[0] is StackAndFrameManagement ) || ( queue[0] is ChildRunnerSequencer ) ) )
				//if ( errors && errors.length > 0 && queue.length == 2 )
				{
					trace("Stopping Point.");
					//Stepping over the Test method, since at least one Before method failed.
					step = queue.shift();	
				}
				
				step = queue.shift();	

				//trace("Sequence Executing Next Step " + step  );
				executeStep( step );
				//trace("Sequence Done Executing Step " + step );
			} else {
				//trace("Sequence Sending Complete " + this );
				sendComplete(); 
			}
		}

		public function AbortableTestStatementSequencer( queue:Array=null )
		{
			super(queue);
		}
	}
}