package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Hit;
/*IMPORT_MODEL*/
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Imran Hossain
 */
@Repository
public interface HitRepository extends JpaRepository<Hit, Integer> {
	List<Hit> findAllByOrderByIdAsc();
	List<Hit> findAllByOrderByIdDesc();
	Page<Hit> findAllByOrderByIdAsc(Pageable page);
	Page<Hit> findAllByOrderByIdDesc(Pageable page);

	List<Hit> findByCreatedByOrderByIdAsc(String createdBy);
	List<Hit> findByCreatedByOrderByIdDesc(String createdBy);
	Page<Hit> findByCreatedByOrderByIdAsc(String createdBy,Pageable page);
	Page<Hit> findByCreatedByOrderByIdDesc(String createdBy,Pageable page);
    @Query(value = "select count(*) from Hit t where t.resource=?1 ",nativeQuery = true)
	Integer findAllByUrl(String url);
	
	/*EXTRA*/
			

}

