package sprint.mvc.baobob.android.persistence;

import spring.mvc.baobob.vo.Parking;

public interface AndroidDAO {

	public Parking getParking();
	public int parkingInsert(Parking pk);
}
