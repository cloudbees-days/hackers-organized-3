import { render, fireEvent, screen } from "@testing-library/vue";
import ListItem from "@/components/ListItem.vue";

test("home page loads", async () => {
  render(ListItem);
});
