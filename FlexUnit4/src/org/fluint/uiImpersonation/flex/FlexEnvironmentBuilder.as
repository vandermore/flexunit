/**
 * Copyright (c) 2010 Digital Primates IT Consulting Group
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

package org.fluint.uiImpersonation.flex {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.utils.getDefinitionByName;
	
	import mx.core.FlexVersion;
	import mx.managers.FocusManager;
	import mx.managers.IFocusManagerContainer;
	
	import org.fluint.uiImpersonation.IVisualEnvironmentBuilder;
	import org.fluint.uiImpersonation.IVisualTestEnvironment;

	/**
	 * Builds a visual test environment for Flex projects 
	 * @author mlabriola
	 * 
	 */
	public class FlexEnvironmentBuilder implements IVisualEnvironmentBuilder {
		/**
		 * @private 
		 */
		protected var environmentProxy:IVisualTestEnvironment;
		/**
		 * @private 
		 */
		protected var visualDisplayRoot:DisplayObjectContainer;

		/** 
		 * Returns a reference to the single instance of a Canvas or Group, depending on
		 * sdk version, where all visual components will be created during testing.
		 * 
		 * @return A reference to the Canvas or Group that serves as the display environment class.
		 */
		public function buildVisualTestEnvironment():IVisualTestEnvironment {
			
			if ( !environmentProxy ) {
				var environmentType:Class;

				/** First we are going to try to get a container for compatibility
				 *  If we cannot, then and only then, will we grab a spark group instead
				 **/
				try {
					environmentType = getDefinitionByName( "mx.core.Container" ) as Class;
					environmentProxy = new FlexMXVisualTestEnvironment( environmentType );
				} catch ( error:Error ) {
					try {
						environmentType = getDefinitionByName( "spark.components.Group" ) as Class;	
						environmentProxy = new FlexSparkVisualTestEnvironment( environmentType );
					} catch ( error:Error ) {
						environmentType = null;
					}
				}
				
				if ( !visualDisplayRoot ) {
					if ( FlexVersion.CURRENT_VERSION > FlexVersion.VERSION_3_0 ) {
						var flexGlobals:Class = Class(getDefinitionByName("mx.core::FlexGlobals"));
						visualDisplayRoot = flexGlobals.topLevelApplication.systemManager;
					} else {
						var appGlobals:Class = Class(getDefinitionByName("mx.core::ApplicationGlobals"));
						visualDisplayRoot = appGlobals.application.systemManager;
					}
				}

				if ( visualDisplayRoot && environmentProxy && ( environmentProxy.testEnvironment is DisplayObject ) ) {
					visualDisplayRoot.addChild( environmentProxy.testEnvironment );
				
					//If the SystemManager tries to remove a child bridge from the instance, from say a SWFLoader,
					//and there isn't a FocusManager, the SystemManager will throw an error.  To circumvent this,
					//we'll give the instance a valid FocusManager.
					//We need to be sure that the FocusManager is created *AFTER* adding the instance to the
					//SystemManager, because the FocusManager uses the instance's SystemManager property
					//during construction.
					if ( environmentProxy is IFocusManagerContainer ) {
						if ( !( environmentProxy as IFocusManagerContainer ).focusManager ) {
							( environmentProxy as IFocusManagerContainer ).focusManager = new FocusManager( ( environmentProxy as IFocusManagerContainer ) );
						}
					}
				}
			}
			
			return environmentProxy;
		}
		
		/**
		 * Constructor 
		 * @param visualDisplayRoot
		 * 
		 */
		public function FlexEnvironmentBuilder( visualDisplayRoot:DisplayObjectContainer ) {
			this.visualDisplayRoot = visualDisplayRoot;			
		}
	}
}