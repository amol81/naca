/*
 * NacaRT - Naca RunTime for Java Transcoded Cobol programs.
 *
 * Copyright (c) 2005, 2006, 2007, 2008 Publicitas SA.
 * Licensed under LGPL (LGPL-LICENSE.txt) license.
 */
/*
 * Created on 22 mars 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package nacaLib.varEx;

/**
 * @author U930DI
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class InitializeManagerInt extends InitializeManager
{
	public InitializeManagerInt(int n)
	{
		m_n = n;
	}
	
	public void set(int n)
	{
		m_n = n;
	}

	public void initialize(VarBufferPos buffer, VarDefBuffer varDef, int nOffset, InitializeCache initializeCache)
	{
		varDef.initializeAtOffset(buffer, nOffset, m_n);
		if(initializeCache != null)
			initializeCache.setNotManaged();
	}

	private int m_n;
}