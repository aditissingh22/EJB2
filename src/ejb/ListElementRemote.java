package ejb;

import java.util.List;

import javax.ejb.Remote;
/**
 * New-->SessionBean-->Stateful-->Check for Remote Interface
 */
@Remote
public interface ListElementRemote {

	void addElement(int e);
	void removeElement(int e);
	
	List<Integer> getElement();
}
