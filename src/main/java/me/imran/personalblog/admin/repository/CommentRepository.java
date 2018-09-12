package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/*IMPORT_MODEL*/

/**
 * @author Imran Hossain
 */
@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {
	List<Comment> findAllByOrderByIdAsc();
	List<Comment> findAllByOrderByIdDesc();
	Page<Comment> findAllByOrderByIdAsc(Pageable page);
	Page<Comment> findById(Integer id, Pageable page);
	Page<Comment> findAllByOrderByIdDesc(Pageable page);
	List<Comment> findByCreatedByOrderByIdAsc(String createdBy);
	List<Comment> findByCreatedByOrderByIdDesc(String createdBy);
	Page<Comment> findByCreatedByOrderByIdAsc(String createdBy, Pageable page);
	Page<Comment> findByCreatedByOrderByIdDesc(String createdBy, Pageable page);


	@Query(value = "SELECT * FROM Comment t order by id desc limit 1", nativeQuery=true)
	Comment getNewComment();

	@Query(value = "SELECT * FROM Comment t where t.PostId=?1 and t.status=true  order by id desc", nativeQuery=true)
	List<Comment> getAllCommentByStatus(Integer id);

}

