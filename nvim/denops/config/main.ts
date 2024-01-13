import * as fn from "https://deno.land/x/denops_std@v5.0.0/function/mod.ts";
import * as mapping from "https://deno.land/x/denops_std@v5.0.0/mapping/mod.ts";
import { Denops } from "https://deno.land/x/denops_std@v5.0.0/mod.ts";
import { ensureString } from "https://deno.land/x/unknownutil@v2.1.1/mod.ts";
import { execute } from "https://deno.land/x/denops_std@v5.0.0/helper/mod.ts";
import { globals } from "https://deno.land/x/denops_std@v5.0.0/variable/mod.ts";

import { Dvpm } from "https://deno.land/x/dvpm@1.0.0/mod.ts";

export async function main(denops: Denops): Promise<void> {

	console.log('load start');
	// NOTE: nvimのみの対応. vimも対応したい場合は
	// const base_path = (await fn.has(denops, "nvim"))
	//  ? "~/.cache/nvim/dvpm"
	//  : "~/.cache/vim/dvpm";
	const basePath = "~/.cache/nvim/denops";

	const base = ensureString(await fn.expand(denops, basePath));

	const dvpm = await Dvpm.begin(denops, { base })
	await dvpm.add({ url: "yukimemi/dps-autocursor" });

	await dvpm.end();

	console.log("load completed!");
};
