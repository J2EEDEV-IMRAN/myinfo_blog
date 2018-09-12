/*
package me.imran.personalblog.admin.repository;

import me.imran.personalblog.admin.model.Role;
import me.imran.personalblog.admin.model.User;
*/
/*IMPORT_MODEL*//*

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

*/
/**
 * @author Imran Hossain
 *//*

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
	List<UserRole> findAllByOrderByIdAsc();
	List<UserRole> findAllByOrderByIdDesc();
	Page<UserRole> findAllByOrderByIdAsc(Pageable page);
	Page<UserRole> findAllByOrderByIdDesc(Pageable page);

	List<UserRole> findByCreatedByOrderByIdAsc(String createdBy);
	List<UserRole> findByCreatedByOrderByIdDesc(String createdBy);
	Page<UserRole> findByCreatedByOrderByIdAsc(String createdBy,Pageable page);
	Page<UserRole> findByCreatedByOrderByIdDesc(String createdBy,Pageable page);


	UserRole findById(String id);

	UserRole findByUserIdAndRoleId(User userId, Role roleId);

    UserRole findByRoleIdAndUserId(Role roleId, User userId);
	
	*/
/*EXTRA*//*

			

}
*/

