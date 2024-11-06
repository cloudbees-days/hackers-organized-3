import { render, fireEvent, screen } from "@testing-library/vue";
import ListItem from "@/components/ListItem.vue";

describe("ListItem.vue", () => {
  it("renders props.title when passed", () => {
    const title = "Super popular article";
    render(ListItem, {
      props: { title },
    });

    screen.getByText(title);
  });
});
