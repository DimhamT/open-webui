<script>
	import { goto } from '$app/navigation';
	import { base } from '$app/paths';
	import { onMount } from 'svelte';

	import Users from '$lib/components/admin/Users.svelte';

	onMount(() => {
		goto(`${base}/admin/users/overview`);
	});
</script>

<Users />
