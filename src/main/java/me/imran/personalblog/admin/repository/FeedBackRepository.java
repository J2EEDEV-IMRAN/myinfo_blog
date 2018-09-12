package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.FeedBack;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/*IMPORT_MODEL*/

/**
 * Created by ataur on 1/25/17.
 */
@Repository
public interface FeedBackRepository extends JpaRepository<FeedBack, Integer> {
	List<FeedBack> findAllByOrderByIdAsc();
	List<FeedBack> findAllByOrderByIdDesc();
	Page<FeedBack> findAllByOrderByIdAsc(Pageable page);
	Page<FeedBack> findAllByOrderByIdDesc(Pageable page);

	List<FeedBack> findByCreatedByOrderByIdAsc(String createdBy);
	List<FeedBack> findByCreatedByOrderByIdDesc(String createdBy);
	Page<FeedBack> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<FeedBack> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);


	
	/*EXTRA*/
			

}

