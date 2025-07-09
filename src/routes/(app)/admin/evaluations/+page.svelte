<script>
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { base } from '$app/paths';

	import Evaluations from '$lib/components/admin/Evaluations.svelte';

	onMount(() => {
		goto(`${base}/admin/evaluations/leaderboard`);
	});
</script>

<Evaluations />
