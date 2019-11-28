package ejb;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;

/**
 * New-->SessionBean-->Stateful
 */
@Stateful
public class ListElements implements ListElementRemote {

	
	List<Integer> values = new ArrayList<>();
	
	@Override
	public void addElement(int e) {
		values.add(e);
	}

	@Override
	public void removeElement(int e) {
		values.remove(new Integer(e));		
	}

	@Override
	public List<Integer> getElement() {
		return values;
	}

    

}
