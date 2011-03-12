/**
 * 
 */
package net;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/** @author KIUSBT */
public class ThreadPool
{
	private static Executor e = Executors.newCachedThreadPool(); // �إ߽u�{��

	/**
	 * @param command
	 * @see java.util.concurrent.Executor#execute(java.lang.Runnable)
	 */
	public static void execute(Runnable command)
	{
		e.execute(command);
	}
}
