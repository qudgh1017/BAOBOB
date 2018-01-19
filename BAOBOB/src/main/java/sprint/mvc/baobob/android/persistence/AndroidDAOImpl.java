package sprint.mvc.baobob.android.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.Parking;

@Repository
public class AndroidDAOImpl implements AndroidDAO{

	@Autowired
	SqlSession sqlSession;

	@Override
	public Parking getParking() {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		return mapper.getParking();
	}
	
	@Override
	public int parkingInsert(Parking pk) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		return mapper.parkingInsert(pk);
	}

	

}
