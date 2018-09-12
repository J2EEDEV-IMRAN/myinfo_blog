/*
package me.ataur.bdlaws.admin.audit;

import javax.persistence.EntityManager;
import javax.persistence.PostPersist;
import javax.persistence.PostUpdate;
import javax.persistence.PreRemove;
import javax.transaction.Transactional;

import static javax.transaction.Transactional.TxType.MANDATORY;

*/
/**
 * @author Naresh Joshi
 *//*


public class VolumeEntityListener {


	@PostPersist
	public void prePersist(Volume target) {
		perform(target, Action.INSERTED);
	}

	@PostUpdate
	public void preUpdate(Volume target) {
		perform(target, Action.UPDATED);
	}

	@PreRemove
	public void preRemove(Volume target) {
		perform(target, Action.DELETED);
	}

	@Transactional(MANDATORY)
	private void perform(Volume target, Action action) {
		EntityManager entityManager = BeanUtil.getBean(EntityManager.class);
		String cl=target.getClass().getSimpleName();
		entityManager.persist(new VolumeHistory(target,action,cl));
		System.out.println("Output test *****************************************************Output test1");
	}

}*/
